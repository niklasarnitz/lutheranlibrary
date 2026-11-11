\version "2.24.3"
% Lochner, IV. Sanctus. Source pages 221–222.
#(set-global-staff-size 16)
\header { tagline = ##f }
\paper {
  paper-width = 120\mm
  left-margin = 3\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm
  indent = 0\mm print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}
global = { \key f \major \time 4/4 \accidentalStyle forget }

\score {
  \new PianoStaff <<
    \new Staff <<
      \clef treble \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice = "soprano" { \voiceOne bes'2 a'2 \bar "|" g'1 \bar "|" f'1 \bar "|" f''2 f''2 \bar "|" d''2 e''2 \bar "|" c''2 bes'4( d''4) \bar "|" f''1 \bar "|" r4 f''4 f''2 \bar "|" }
      \new Voice = "alto" { \voiceTwo f'2 f'2 e'1 c'1 d'2 a'2 g'2 g'2 f'2. g'4 d'1 s4 a'4 a'2 }
    >>
    \new Lyrics \lyricsto "soprano" { \set ignoreMelismata = ##t in der Hö -- "he!" Ge -- lo -- bet "sei," der \skip 1 da kommt im "Na-" }
    \new Staff <<
      \clef bass \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice { \voiceOne d'2 c'2 c'1 a1 bes2 c'2 b!2 c'2 a2. c'4 f4 g8[( a8] bes2) r4 c'4 c'2 }
      \new Voice = "bass" { \voiceTwo bes,2 f2 c1 f1 bes,2 f2 g2 c2 f2 d4( c4) bes,1 s4 f4 f2 }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
