\version "2.24.3"
% Lochner, V. Sanctus. Source pages 223–224.
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
      \clef treble \once \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice = "soprano" { \voiceOne d''2 c''2 \bar "||" \time 3/4 c''8.^\markup \tiny "Knaben oder Einzelne." c''16 c''4 a'4 \bar "|" bes'8.^\markup \tiny "Chor." bes'16 bes'4 g'4 \bar "|" a'8.^\markup \tiny "Gemeinde." a'16 a'4 b'!4 \bar "|" }
      \new Voice = "alto" { \voiceTwo g'4.( f'8) e'2 a'8. a'16 a'4 f'4 d'8. d'16 d'4 e'4 f'8. f'16 f'4 g'4 }
    >>
    \new Lyrics \lyricsto "soprano" { \set ignoreMelismata = ##t Eh -- "re." Ho -- si -- an -- "na," Ho -- si -- an -- "na," Ho -- si -- an -- na }
    \new Staff <<
      \clef bass \once \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice { \voiceOne c'4( b!4) g2 r2. g8. g16 g4 c'4 c'8. c'16 d'4 d'4 }
      \new Voice = "bass" { \voiceTwo g,2 c2 s2. r2. f8. f16 d4 g4 }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
