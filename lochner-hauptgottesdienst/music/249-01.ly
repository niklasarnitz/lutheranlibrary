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
      \new Voice = "soprano" { \voiceOne a'8. a'16 a'8 a'8 bes'2 \bar "|" g'4 c''4 a'4 d''4 \bar "|" c''4 b'!8 b'8 c''2\fermata \bar "||" \time 3/4 c''8.^\markup \tiny "Knaben oder Einzelne." c''16 c''4 a'4 \bar "|" }
      \new Voice = "alto" { \voiceTwo f'8. f'16 f'8 f'8 f'2 e'4 g'4 f'4 a'4 g'4 g'8 g'8 g'2 a'8. a'16 a'4 f'4 }
    >>
    \new Lyrics \lyricsto "soprano" { \set ignoreMelismata = ##t sei Ma -- ri -- ens "Sohn," der da kommt im Na -- men des "HErrn." Ho -- si -- an -- "na," }
    \new Staff <<
      \clef bass \once \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice { \voiceOne d'8. d'16 d'8 d'8 d'2 c'4 c'4 c'4 e'4 e'4 d'8 d'8 e'2 r2. }
      \new Voice = "bass" { \voiceTwo d8. d16 d8 d8 bes,2 c4 e4 f4 d4 g4 g,8 g,8 c2 s2. }
    >>
  \new Lyrics \lyricsto "bass" { \set ignoreMelismata = ##t sei das Pas -- sah -- "lamm," das }
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
